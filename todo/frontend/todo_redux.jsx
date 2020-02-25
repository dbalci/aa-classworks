import React from 'react';
import ReactDOM from 'react-dom';
import { receiveTodos, receiveTodo} from "./actions/todo_actions";
import configureStore from './store/store'

document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById("root");
    const store = configureStore();
    ReactDOM.render(<h1> React </h1>,root)
        window.receiveTodos = receiveTodos,
        window.receiveTodo = receiveTodo,
        window.store = store
});