import * as yup from "yup";

const userLogin = {
  user_id: yup.string().email(),
  password: yup.string().required().trim(),
  fcm: yup.string().trim(),
};

const userSchema = {
  ...userLogin,
  email: yup.string().email().trim(),
  role: yup.string().oneOf(["patient", "doctor", "hospital"]),
  phone: yup.string().length(10).required().trim(),
  name: yup.string().required().trim(),
  interestes: yup.array(),
  documents: yup.array(),
};

export const loginUserSchema = new yup.ObjectSchema(userLogin);
export const createUserSchema = new yup.ObjectSchema(userSchema);
export const updateUserSchema = new yup.ObjectSchema({
  ...userSchema,
});
export const deleteUserSchema = new yup.ObjectSchema({
  user_id: yup.string().required().trim(),
});
