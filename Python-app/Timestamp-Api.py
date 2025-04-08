from fastapi import FastAPI
from datetime import datetime, timezone
import pytz

app = FastAPI()

@app.get("/datetime")
def current_datetime():
    utc_now = datetime.now(pytz.utc)
    return {

        "datetime": utc_now.isoformat()
       
    }