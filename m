Return-Path: <cazfi74@gmail.com>
Received: from mail-qe0-f47.google.com (mail-qe0-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id AEE5460C11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 05:47:39 +0000 (UTC)
Received: by mail-qe0-f47.google.com with SMTP id 5so3955178qeb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 21:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0HYHclyvlR8ytXrwLubWkbt/N/Ewnbk+R8qSH/zoy8w=;
	b=nBS14kdVi9efrnZaV5hBWc/Bl44Yp08N6+/HMeD4umaf6ltrVjfKxSsJjEBvFEzBAE
	jGHD5ibbl61AH7XdW/s3Vfp0aSx2sCzfYOz7CQw5hEmBACF2CZ76/SNAjyyouc6c9CZS
	vltMN7UYBubzB1vAmZZkSk/RkO8qve4fgCmBk0BFco29nU42Pj0Kc6GTZEcjqyoaE7jv
	wln3rHoKKyijiWaKdeSRlXR0a7rLvDG/vLOnor4MQhyC0gbqgUNw0Nkd6RGb8xBPl6c+
	ffBwFTMA0GldiCELRcaOKNelx5r9/L8bKvjzijF4U1ElTi2AXbNyQ6AqS1zjpFGqlSo1
	Vo9w==
MIME-Version: 1.0
X-Received: by 10.49.52.34 with SMTP id q2mr3493955qeo.10.1389332860092; Thu,
	09 Jan 2014 21:47:40 -0800 (PST)
Received: by 10.224.38.7 with HTTP; Thu, 9 Jan 2014 21:47:40 -0800 (PST)
In-Reply-To: <CADkTA4PPOLuEj8N+1w6N864g2HPyYBjK8Go+8P+iXKCcL=-oPA@mail.gmail.com>
References: <52CEEE43.1090209@linaro.org>
	<CADkTA4M+KG9uXtb91ANThgzMgOAb0WjiVmBvf48UszmSnX62dA@mail.gmail.com>
	<52CF2625.5030407@windriver.com> <52CF2ED0.8090605@linaro.org>
	<CADkTA4PPOLuEj8N+1w6N864g2HPyYBjK8Go+8P+iXKCcL=-oPA@mail.gmail.com>
Date: Fri, 10 Jan 2014 07:47:40 +0200
Message-ID: <CAF6bG8eTWuo9mg0pm5EgWCvOY85A-Khpc0HvZ7Hn5BsW3rSksQ@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: unmaintained layers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jan 2014 05:47:39 -0000
Content-Type: text/plain; charset=UTF-8

On 10 January 2014 06:54, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Thu, Jan 9, 2014 at 6:20 PM, Trevor Woerner
> <trevor.woerner@linaro.org> wrote:
>> On 01/09/14 17:43, Mark Hatle wrote:
>>> On 1/9/14, 3:45 PM, Bruce Ashfield wrote:
>>>> On Thu, Jan 9, 2014 at 1:45 PM, Trevor Woerner
>>>> <trevor.woerner@linaro.org> wrote:
>>>>> Hi everyone,
>>>>>
>>>>> At the last TSC meeting the topic of unmaintained layers came up. Here
>>>>> is the sorted list of master layers from the layer index [1], would it
>>>>> be possible for those in the know to indicate which layers are, or are
>>>>> suspected of being, unmaintained?
>>>>
>>>> Wouldn't it be easier to do an initial sort based on commit activity
>>>> ? Versus an
>>>> opt-in query ?
>>>
>>> I agree..  see below for mine..
>>
>> To be honest, I had asked people to indicate which layers they thought
>> were *un*maintained (since I assumed that list would be small), but this
>> way works too.

 I maintain meta-games, though I have only very little time to give it
- not much activity to add new games, just keeping existing things
working. That's to say that I would consider passing main
maintainership, and keeping working only on my own games myself, to
someone more active if someone steps up.



 - ML

