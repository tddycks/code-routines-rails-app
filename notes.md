users
has_many :routines

routines
belongs_to :user
has_many :routine_focuses
has_many :focuses, through: routine_focuses

focuses
has_many :routine_focuses
has_many :routines, through: routine_focuses
has_many :notes

routine_focuses
belongs_to :focus
belongs_to :routine

notes
belongs_to :focus



users
name:string
username:string
email:string

routines
name:string
user_id:integer
public:boolean

focuses
name:string
start_time:time
end_time:time

routine_foucuses
routine_id:integer
focus_id:integer


notes
focus_id:integer