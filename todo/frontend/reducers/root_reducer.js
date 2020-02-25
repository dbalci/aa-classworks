import { combineReducers } from 'redux';
import todoReducer from "./todos_reducer";

const rootReducer = combineReducers({
    todos: todoReducer
    

});


export default rootReducer