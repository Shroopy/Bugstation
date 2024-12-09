#define TAG_ENGINEERING "engineering"
#define TAG_MEDICAL "medical"
#define TAG_SECURITY "security"
#define TAG_SCIENCE "science"
#define TAG_WIZARD "wizard"

#define UNIFIED_WAIT_TIME 20 SECONDS

#define UNIFIED_PANEL_MAIN "Main"
#define UNIFIED_PANEL_VARIABLES "Variables"

#define COST_VERY_MINOR 5
#define COST_MINOR 10
#define COST_MODERATE 20
#define COST_SEMIMAJOR 30
#define COST_MAJOR 60
#define COST_SUPERMAJOR BASE_POINTS * 1.25

#define WEIGHT_NORMAL 10
#define WEIGHT_LESS_LIKELY 7.5
#define WEIGHT_UNLIKELY 5

// TODO add to config
#define BASE_POINTS 120

#define STARTING_DELAY 10 * BASE_POINTS/starting_points MINUTES
#define SCHEDULE_DELAY 3 MINUTES

#define COOLDOWN_MULT (120/BASE_POINTS) * (BASE_POINTS/starting_points)
