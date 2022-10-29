export type CourseType = {
    term: String,
    status: String,
    name: String,
    location: String,
    meeting: String,
    faculty: String,
    capacity: String,
    credits: String,
    level: String
};

export type CoursesType = Array<CourseType>;