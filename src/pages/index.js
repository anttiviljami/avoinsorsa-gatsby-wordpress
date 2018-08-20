import * as _ from 'lodash'
import React from 'react';
import Post from '../components/post';

export default ({ data }) => {
  const posts = _.get(data, 'allWordpressPost.edges');
  return <div>
    <h1>Avoinsorsa</h1>{}
    { posts.map(post => <Post key={post.node.id} post={post.node} />) }
  </div>
}

export const query = graphql`
query posts {
  allWordpressPost {
    edges {
      node {
        id
        slug
        title
        content
        excerpt
        date
        modified
      }
    }
  }
}
`;
