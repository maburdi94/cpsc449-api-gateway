# Timeline API

## __<span style="color: #7df">GET /posts</span>__

### Description
Gets recent posts

### Optional Query Parameters

`?user=` specifies the username for the author of the posts to Request

`?page=` specifies the page of the posts (requests are limited to 25 posts per request)

If not one the parameters are specified, the request will return only the last 25 posts from all users in reverse chronological order.

### Examples
```
http GET /posts
```
```json
{
  "posts": [
    ...,
    {
      "text": "Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.",
      "timestamp": "2021-01-28 01:22:31",
      "username": "triden2"
    },
    ...
  ]
}
```

```
http GET /posts?user=maburdi
```
```json
{
  "posts": [
    ...,
    {
      "text": "In hac habitasse platea dictumst.",
      "timestamp": "2021-02-27 01:10:41",
      "username": "maburdi"
    },
    ...
  ]
}
```

### Errors
<table>
  <tr>
    <th>HTTP Code</th>
    <th>Reason</th>
  </tr>
  <tr>
    <td>400 Bad Request</td>
    <td>Missing one of the required data in body</td>
  </tr>
  <tr>
    <td>500 Server Error</td>
    <td>Problem with code on the server</td>
  </tr>
</table>


<br><br>


## __<span style="color: #7df">GET /timeline/\<username\></span>__

### Description
Get a user's home timeline

### Example
`http POST /timeline/hbuckland6`
```json
{
    "posts": [
        ...
        {
            "text": "Nulla tellus. In sagittis dui vel nisl.",
            "timestamp": "2021-01-14 08:55:18",
            "username": "cfreen0"
        },
        ...
    ]
}
```

### Errors
<table>
  <tr>
    <th>HTTP Code</th>
    <th>Reason</th>
  </tr>
  <tr>
    <td>400 Bad Request</td>
    <td>Missing one of the required data in body</td>
  </tr>
  <tr>
    <td>500 Server Error</td>
    <td>Problem with code on the server</td>
  </tr>
</table>



<br><br>



## __<span style="color: #7df">POST /posts</span>__

### Description
Create a new post

### Example
```
http POST /posts \
username=maburdi \
text='In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.'
```

#### Note:
A timestamp is created automatically on the post when the post is inserted into the database.


### Errors
<table>
  <tr>
    <th>HTTP Code</th>
    <th>Reason</th>
  </tr>
  <tr>
    <td>400 Bad Request</td>
    <td>Missing password on request body</td>
  </tr>
  <tr>
    <td>500 Server Error</td>
    <td>Problem with code on the server</td>
  </tr>
</table>



<br><br>


# Installation

__Step 1.__ Download the `users.tar.xf` file, move it into a separate directory, then uextract the contents into that directory.

```console
mkdir timeline
mv timeline.tar.xz timeline/
cd timeline
tar -xf timeline.tar.xz
```

__Step 2.__  Run `init.sh` script to initialize the database.

```console
sh /bin/init.sh
```

__Step 3.__ Use Foreman to launch the server with the default port of `5000`.

```console
foreman start timeline
```
