"use client";
import React, { useEffect, useState } from "react";
import Chart from "react-apexcharts";

async function getUserDetails(jwt: string) {
  const data = await fetch("http://localhost:8080/api/user/get-details", {
    headers: {
      Authorization: `Bearer ${jwt}`,
    },
  });
  console.log(data);

  return await data.json();
}

const Page = () => {
  const [options, setOptions] = useState<any>({});
  const [ailments, setAilments] = useState<
    {
      name: string;
      severity: string;
      lab_test: string[];
      symptoms: string[];
      date: string;
      doctor: { name: string; type: string; rating: number };
    }[]
  >([]);
  useEffect(() => {
    console.log("here");

    (async () => {
      const data = await getUserDetails(
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1iYXJ0b2xvbWVhenppMUBuYXRpb25hbGdlb2dyYXBoaWMuY29tIiwiaWF0IjoxNjg5OTgzMzY3fQ.a_Lp4u_OhoNzv6Rc3yVQW2yUHnLxipW_sInsWPKYRwk",
      );
      console.log(data);
      setAilments(data.user.ailments);
    })();
  }, []);

  useEffect(() => {
    setOptions({
      chart: {
        id: "basic-bar",
      },
      xaxis: {
        categories: ailments?.map((al) => al.date),
      },
    });
    setSeries([
      {
        name: "series-1",
        data: ailments?.map((al) =>
          al.severity === "high"
            ? Math.random() * 0.25 + 0.75
            : al.severity === "low"
            ? Math.random() * 0.25
            : Math.random() * 0.5 + 0.25,
        ),
      },
    ]);
  }, [ailments]);
  const [series, setSeries] = useState<any[]>([
    {
      name: "series-1",
      data: ailments?.map((al) =>
        al.severity === "high" ? 1 : al.severity === "low" ? 0 : 0.5,
      ),
    },
  ]);
  return <Chart options={options} series={series} type="line" width="500" />;
};

export default Page;
