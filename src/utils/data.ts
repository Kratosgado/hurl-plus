import { VARIABLE_DETAILS } from "./types";

export const VARIABLE_TYPES: VARIABLE_DETAILS[] = [
    { label: "Bearer Token", detail: "Authorization: Bearer {{variable_name}}", suggestedName: "bearer_token", prefix: "Bearer " },
    { label: "Basic Auth", detail: "Authorization: Basic {{variable_name}}", suggestedName: "basic_credentials", prefix: "Basic " },
    { label: "API Key", detail: "Used as {{variable_name}} in headers or query params", suggestedName: "api_key", prefix: "" },
    { label: "Custom Var", detail: "Choose your own variable name", suggestedName: "token", prefix: "" },
];