users
has_many :workouts

workouts
belongs_to :user
has_many :focus_workouts
has_many :focuses, through: focus_workouts

focuses
has_many :focus_workouts
has_many :workouts, through: focus_workouts
has_many :notes

focus_workouts
belongs_to :focus
belongs_to :workout

notes
belongs_to :focus



users
name:string
username:string
email:string

workouts
name:string
user_id:integer
public:boolean

focuses
name:string
start_time:time
end_time:time

focus_workouts
workout_id:integer
focus_id:integer


notes
focus_id:integer