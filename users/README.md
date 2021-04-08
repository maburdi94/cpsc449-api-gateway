# Users API

## __<span style="color: #7df">GET /users</span>__

### Description
Gets all users

### Example
```
http GET /users
```
```json
true
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


## __<span style="color: #7df">POST /users</span>__

### Description
Create a new user.

### Example
```
http POST /users \
username=maburdi \
email=michaelburdi@csu.fullerton.edu \
password=thI$_IS_mY_Pas$WOrd
```
```json
true
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



## __<span style="color: #7df">POST /users/\<username\>/verify</span>__

### Description
Verify the password of a user if correct.

### Example
`http POST /users/maburdi/verify password=thI$_is_NOT_mY_Pas$WOrd`

```json
false
```


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


## __<span style="color: #7df">POST /users/\<usernameToFollow\>/follow/\<username\></span>__

### Description
Add relationship `username` following `usernameToFollow`

### Example
`http POST /users/realdonaldtrump/follow/maburdi/`

### Errors
<table>
  <tr>
    <th>HTTP Code</th>
    <th>Reason</th>
  </tr>
  <tr>
    <td>500 Server Error</td>
    <td>Problem with code on the server</td>
  </tr>
</table>



<br><br>


## __<span style="color: #7df">DELETE /users/\<usernameToUnfollow\>/follow/\<username\></span>__

### Description
Remove relationship `username` following `usernameToUnfollow`

### Example
`http DELETE /users/realdonaldtrump/follow/maburdi/`

### Errors
<table>
  <tr>
    <th>HTTP Code</th>
    <th>Reason</th>
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
mkdir users
mv users.tar.xz users/
cd users
tar -xf users.tar.xz
```

__Step 2.__  Run `init.sh` script to initialize the database.

```console
sh /bin/init.sh
```

__Step 3.__ Use Foreman to launch the server with the default port of `5000`.

```console
foreman start users
```
