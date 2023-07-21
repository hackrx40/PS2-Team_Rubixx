import Router, { useRouter } from "next/router";
import { parseCookies } from "nookies";
import React, { useEffect, useState } from "react";
// import { getQuestions, getScores } from "../../utils/api";

const Quiz = () => {
  const [questions, setQuestions] = useState<any[]>([]);
  const [current, setCurrent] = useState(0);
  const [marked, setMarked] = useState<any[]>([]);
  const [isSubmitting, setIsSubmitting] = useState(false);

  const router = useRouter();
  const { name } = router.query;

  //   useEffect(() => {
  //     setMarked([]);
  //     (async () => {
  //       try {
  //         const questionData = await getQuestions(
  //           name,
  //           parseCookies().accessToken,
  //         );
  //         setQuestions(questionData.data);
  //         questionData.data.map((question: any) =>
  //           setMarked((old) => [...old, { _id: question._id, option: -1 }]),
  //         );
  //       } catch (err) {
  //         Router.push("/tests");
  //         console.log(err);
  //       }
  //     })();
  //   }, [name]);

  const selectOption = (id: any) => {
    marked &&
      setMarked((old) => {
        return old.map((checked, curr_id) => {
          if (curr_id === current) return { ...checked, option: id };
          else return checked;
        });
      });
  };

  const nextQuestion = () => {
    if (current < questions.length - 1) setCurrent(current + 1);
  };

  const prevQuestion = () => {
    if (current > 0) setCurrent(current - 1);
  };

  const givenQuestion = (id: any) => {
    setCurrent(id < questions.length ? id : questions.length - 1);
  };

  //   const submitTest = async () => {
  //     setIsSubmitting(true);
  //     const res = await getScores(name, marked, parseCookies().accessToken);
  //     if (res.success) {
  //       setIsSubmitting(false);
  //       Router.push("/tests");
  //     }
  //   };
  return (
    <div className="h-screen bg-[#f1f1f1] pt-28 md:p-20 p-3">
      <div className="m-4 text-2xl font-semibold">Test Physics</div>

      <div className="flex flex-col-reverse gap-6 md:flex-row md:gap-[2%]">
        <div className="p-3 md:p-8 bg-white md:w-8/12 rounded-xl test-shadow">
          <div className="mb-2">
            Question {current + 1} of {questions.length}
          </div>
          {questions
            ? questions.length > 0 && (
                <>
                  <div className="text-2xl mb-8">
                    {questions[current].statement}
                  </div>
                  <div className="grid grid-cols-1 md:grid-cols-2 ">
                    {console.log(marked)}
                    {questions[current].option.map((text: any, id: number) => {
                      return (
                        <p
                          key={id}
                          onClick={() => selectOption(id)}
                          className={`p-4 my-2 mx-3 cursor-pointer hover:scale-105 rounded-md transition-all duration-200  ${
                            marked &&
                            marked[current] &&
                            marked[current].option === id
                              ? "bg-green-400"
                              : "bg-neutral-200"
                          }`}
                        >
                          {id + 1})&nbsp;{text}
                        </p>
                      );
                    })}
                  </div>
                  <div className="flex justify-between">
                    <div className="ml-auto">
                      <button
                        className="min-w-[8rem] py-2 mx-2 mt-4 border-blue-accent text-blue-accent border-2 rounded-xl hover:scale-105 transition-all"
                        onClick={prevQuestion}
                      >
                        Prev
                      </button>
                      {!(current == questions.length - 1) && (
                        <button
                          className="min-w-[8rem] py-2 mx-2 mt-4 border-blue-accent text-blue-accent border-2 rounded-xl hover:scale-105 transition-all"
                          onClick={nextQuestion}
                        >
                          Next
                        </button>
                      )}
                    </div>
                    <button
                      onClick={async () => {
                        // setIsSubmitting(true);
                        // const res = await getScores(
                        //   name,
                        //   marked,
                        //   parseCookies().accessToken,
                        // );
                        // if (res.success) {
                        //   // const update = await updateTest(
                        //   //   name,
                        //   //   { type: 2 },
                        //   //   parseCookies().accessToken,
                        //   // );
                        //   // update.success &&
                        //   setIsSubmitting(false);
                        //   Router.push("/tests");
                        // }
                      }}
                      className={`bg-green-600 min-w-[8rem] py-2 mx-2 mt-4 text-white hover:shadow-xl duration-200 transition-all rounded-xl hover:scale-105 ${
                        current == questions.length - 1 ? "block" : "hidden"
                      }`}
                    >
                      {isSubmitting ? "Loading" : "Submit"}
                    </button>
                  </div>
                </>
              )
            : "no question"}
        </div>
        <div className="md:w-4/12 bg-white rounded-xl p-4 test-shadow">
          <h2 className="text-2xl mb-4">Questions</h2>
          <div className="flex flex-wrap gap-4">
            {[...Array(questions.length)].map((_, id) => (
              <div
                key={id}
                className={`h-min px-6 py-4 rounded-md cursor-pointer hover:scale-110 transition-all ${
                  current == id
                    ? "bg-[#1FA1F4] text-white"
                    : "bg-neutral-300 text-black"
                }`}
                onClick={() => setCurrent(id)}
              >
                {id + 1}
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Quiz;
