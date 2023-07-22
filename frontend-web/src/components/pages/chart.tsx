import React from "react";
import Chart from "react-apexcharts";

async function getUserDetails(jwt: string) {
  const data = await fetch("http://localhost:8080/api/user/get-details", {
    headers: {
      Authorization: `Bearer ${jwt}`,
    },
  });

  return await data.json();
}

if (typeof window == "undefined") {
}

const Page = ({ ailments }: any) => {
  const options = {
    chart: {
      id: "basic-bar",
    },
    xaxis: {
      categories: ailments?.map((al: any) => al.date),
    },
  };
  const series = [
    {
      name: "series-1",
      data: ailments?.map((al: any) =>
        al.severity === "high"
          ? Math.random() * 0.25 + 0.75
          : al.severity === "low"
          ? Math.random() * 0.25
          : Math.random() * 0.5 + 0.25,
      ),
    },
  ];

  return <Chart options={options} series={series} type="line" width="500" />;
};

export default Page;

export async function getServerSideProps() {
  const ailments = (
    await getUserDetails(
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1iYXJ0b2xvbWVhenppMUBuYXRpb25hbGdlb2dyYXBoaWMuY29tIiwiaWF0IjoxNjg5OTgzMzY3fQ.a_Lp4u_OhoNzv6Rc3yVQW2yUHnLxipW_sInsWPKYRwk",
    )
  ).user.ailments;
  return { props: { ailments } };
}
