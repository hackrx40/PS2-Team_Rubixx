import { useEffect, useState } from "react";
import Chart from "react-apexcharts";
import logo from "./logo.svg";

async function getUserDetails(jwt) {
  const data = await fetch("http://localhost:8080/api/user/get-details", {
    headers: {
      Authorization: `Bearer ${jwt}`,
    },
  });

  return await data.json();
}
function App() {
  const [options, setOptions] = useState();
  const [series, setSeries] = useState();
  const searchParams = new URLSearchParams(document.location.search);
  useEffect(() => {
    console.log("here");
    (async () => {
      const ailments = (await getUserDetails(searchParams.get("jwt"))).user
        .ailments;
      const options = {
        chart: {
          id: "basic-bar",
        },
        xaxis: {
          categories: ailments?.map((al) => al.date),
        },
      };
      const series = [
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
      ];
      setSeries(series);
      setOptions(options);
    })();
  }, []);
  return (
    <div className="App">
      {options && series && (
        <Chart options={options} series={series} type="line" width="500" />
      )}
    </div>
  );
}

export default App;
