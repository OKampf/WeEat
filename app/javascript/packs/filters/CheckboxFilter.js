import React from 'react'

export default class CheckboxFilter extends React.Component {

    constructor(props) {
        super(props);
    }

    render() {
        <div className="checkbox-wrapper">
            <input
                name={this.props.inputName}
                type="checkbox"
                checked={this.props.isChecked}
                onChange={this.props.onCheckChange}/>
            {this.props.label}
        </div>
    }
}

