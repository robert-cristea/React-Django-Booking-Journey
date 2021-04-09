class bubble {
    constructor(canvasWidth, canvasHeight, color) {
        this.maxHeight = canvasHeight;
        this.maxWidth = canvasWidth;
        this.color = color;
        this.randomise();
    }

    generateDecimalBetween(min, max) {
        return (Math.random() * (min - max) + max).toFixed(2);
    }

    update() {
        this.posX = this.posX - this.movementX;
        this.posY = this.posY - this.movementY;

        if (this.posY < 0 || this.posX < 0 || this.posX > this.maxWidth) {
            this.randomise();
            this.posY = this.maxHeight;
            // this.posX = this.posX + this.movementX;
        // this.posY = this.posY + this.movementY;
        }
    }

    randomise() {
        this.color = Math.random() * 255;
        // this.color = "0,0,0";
        // this.size = this.generateDecimalBetween(20, 60);
        this.size = 100;
        this.movementX = this.generateDecimalBetween(-0.4, 0.4);
        this.movementY = this.generateDecimalBetween(0.7, 2);
        this.posX = this.generateDecimalBetween(0, this.maxWidth);
        this.posY = this.generateDecimalBetween(0, this.maxHeight);
    }
}

class background {
    constructor(id, color) {
        this.canvas = document.getElementById(id);
        this.ctx = this.canvas.getContext("2d");
        this.canvas.height = window.innerHeight;
        this.canvas.width = window.innerWidth;
        this.color = color;
        this.bubblesList = [];
        this.generateBubbles();
        this.animate();
        
    }

    animate() {
        let self = this;
        self.ctx.clearRect(0, 0, self.canvas.width, self.canvas.height);
        self.bubblesList.forEach(function(bubble) {
            bubble.update();
            self.ctx.beginPath();
            self.ctx.arc(bubble.posX, bubble.posY, bubble.size, 0, 2 * Math.PI);
            self.ctx.fillStyle = "rgba(" + bubble.color + ", 0.39)";
            self.ctx.fill();
            self.ctx.strokeStyle = "rgba(" + bubble.color + ", 0.39)";
            self.ctx.stroke();
        });

        requestAnimationFrame(this.animate.bind(this));
    }

    addBubble(bubble) {
        return this.bubblesList.push(bubble);
    }

    generateBubbles() {
        let self = this;
        for (let i = 0; i < 5; i++) {
            self.addBubble(new bubble(self.canvas.width, self.canvas.height, self.color));
        }
    }

    bubbleDensity() {
        return Math.sqrt((this.canvas.height, this.canvas.width) * 5);
    }
}

export default function init(id, color) {
    new background(id, color);
};

window.requestAnimFrame = (function() {
    return (
        window.requestAnimationFrame ||
        window.webkitRequestAnimationFrame ||
        window.mozRequestAnimationFrame ||
        window.oRequestAnimationFrame ||
        window.msRequestAnimationFrame ||
        function(callback) {
            window.setTimeout(callback, 1000 / 60);
        }
    );
})();