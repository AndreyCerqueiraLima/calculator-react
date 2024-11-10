import React from "react";

import './Button.css';


export default props => { 
    let classes = `button ${props.cName}` 
    
    return <button onClick={e => props.click && props.click(props.label)} 
                   className={classes}>
                    {props.label}
                   </button>

}