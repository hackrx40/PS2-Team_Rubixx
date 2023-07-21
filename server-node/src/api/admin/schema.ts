import * as yup from "yup";

const admin = {
  email: yup.string().email().trim(),
  password: yup.string().required().trim(),
};

export const adminSchema = new yup.ObjectSchema(admin);
