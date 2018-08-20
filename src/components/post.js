import * as _ from 'lodash';
import React from 'react';

export default ({ post }) => {
  const { title, content } = post;
  return <div>
    <h2>{ title }</h2>
    <div dangerouslySetInnerHTML={{ __html: content }}/>
  </div>
}