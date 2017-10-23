import React from 'react'

export default class StarsPanel extends React.Component{

    constructor(props){
        super(props);
    }

    render(){

        let stars = [];
        for(let i=0; i< this.props.numGolden; i++)
        {
            stars.push(1);
        }
        for(let i=stars.length; i<this.props.numTotal;i++)
        {
            stars.push(0);
        }

        stars = stars.map((star, index) => {
            if (star==1){
                return(<span key={index} className="golden-star">★</span>);
            }else{
                return (<span key={index} className="gray-star">★</span>);
            }
        });

        return (
            <div class="stars-panel">
                {stars}
            </div>
        );
    }
}