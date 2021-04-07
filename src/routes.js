import React from "react";
import { Route } from "react-router-dom";
import Hoc from "./hoc/hoc";

import Login from "./containers/Login";
import Signup from "./containers/Signup";
// import HomepageLayout from "./containers/Home";
import Home from "./containers/Homes";

const BaseRouter = () => (
  <Hoc>
    <Route path="/signin" component={Login} />
    <Route path="/signup" component={Signup} />
    <Route exact path="/" component={Home} />
  </Hoc>
);

export default BaseRouter;
