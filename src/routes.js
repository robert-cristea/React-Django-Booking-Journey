import React from "react";
import { Route } from "react-router-dom";
import Hoc from "./hoc/hoc";
import Home from "./containers/Home";

const BaseRouter = () => (
  <Hoc>
    <Route exact path="/" component={Home} />
  </Hoc>
);

export default BaseRouter;