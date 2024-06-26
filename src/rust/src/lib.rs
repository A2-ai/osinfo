use extendr_api::prelude::*;
use std::env;

#[derive(Debug, PartialEq, IntoDataFrameRow)]
struct OsInfo {
    version: String,
    os_type: String,
    architecture: Option<String>,
}
/// get os information
#[extendr]
fn os_info_impl() -> List {
    let info = os_info::get();
    list!(
        version = info.version().to_string(),
        os_type = info.os_type().to_string(),
        edition = info.edition(),
        architecture = info.architecture(),
        codename = info.codename(),
        os = env::consts::OS,
    )
}

// Macro to generate exports.
// This ensures exported functions are registered with R.
// See corresponding C code in `entrypoint.c`.
extendr_module! {
    mod osinfo;
    fn os_info_impl;
}
