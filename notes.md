users
has_many :workouts

workouts
belongs_to :user
has_many :focus_workouts
has_many :focuses, through: focus_workouts

focuses
has_many :focus_workouts
has_many :workouts, through: focus_workouts

focus_workouts
belongs_to :focus
belongs_to :workout




users
name:string
username:string
email:string

workouts
name:string
*** description:text
*** duration:string

user_id:integer
public:boolean

focuses
name:string
***description:string
*** duration:integer


focus_workouts
workout_id:integer
focus_id:integer

