![Screenshot (2)](https://user-images.githubusercontent.com/104757823/186081151-0a7aabf7-beea-45a0-91aa-e71e40a6d2b6.png)
![Screenshot (3)](https://user-images.githubusercontent.com/104757823/186081153-9b0c3dd9-f781-4979-b123-73267fe27f44.png)
![Screenshot (4)](https://user-images.githubusercontent.com/104757823/186081155-e0353c8c-f684-4927-93a6-2412191d4f2d.png)
![Screenshot (5)](https://user-images.githubusercontent.com/104757823/186081158-039da9c0-41ab-441e-a933-8585ddc467d3.png)
![Screenshot (7)](https://user-images.githubusercontent.com/104757823/186081162-752b4a1f-ac31-49fd-84c8-9a3ddd409560.png)
![Screenshot (8)](https://user-images.githubusercontent.com/104757823/186081166-a56f69dd-37dc-438e-8b87-23fff7776ad6.png)
![Screenshot (9)](https://user-images.githubusercontent.com/104757823/186081171-c31f514b-3c68-4b3b-8280-7e77e25b342f.png)
![Screenshot (10)](https://user-images.githubusercontent.com/104757823/186081176-b004982f-a895-4031-8221-a3d6178670ce.png)
![Screenshot (11)](https://user-images.githubusercontent.com/104757823/186081178-5f934ca9-45f9-4500-b8b0-7704f8b58a44.png)
![Screenshot (12)](https://user-images.githubusercontent.com/104757823/186081180-6812e975-56f1-4c33-b999-4e7f7161dcd5.png)
![Screenshot (13)](https://user-images.githubusercontent.com/104757823/186081182-75c856ec-6408-4c77-abc4-07f0bf71bd42.png)
# Running the project

## Required:

- .env file (with ACCESS_TOKEN_SECRET and REFRESH_TOKEN_SECRET variables)
- mysql database (edit the ormconfig.json)

## Run migration with:

```
npm run typeorm migration:run
```

## API End-Points

- /auth/login
- /auth/check
- /auth/logout
- /auth/signup
- /polls/
- /polls/start
- /polls/status
- /polls/end
- /polls/reset
- /polls/voters
- /polls/vote
- /users/all
- /users/verify
- /users/delete/:id
