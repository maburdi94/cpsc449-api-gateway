# foreman start -m gateway=1,users=1,timelines=3,user-queries=1,timeline-queries=1
gateway: cd gateway && python3 -m bottle --bind=localhost:$PORT --debug --reload gateway
users: cd users && python3 -m bottle --bind=localhost:$PORT --debug --reload users
timeline: cd timeline && python3 -m bottle --bind=localhost:$PORT --debug --reload timeline
