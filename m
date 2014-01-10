Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 4A183600AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 01:14:44 +0000 (UTC)
Received: (qmail 4821 invoked by uid 1003); 10 Jan 2014 01:14:44 -0000
Received: from unknown (HELO ?192.168.254.26?)
	(philip@opensdr.com@74.47.80.243)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	10 Jan 2014 01:14:44 -0000
Message-ID: <52CF4983.4070501@balister.org>
Date: Thu, 09 Jan 2014 20:14:43 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Trevor Woerner <trevor.woerner@linaro.org>
References: <52CEEE43.1090209@linaro.org>	<CADkTA4M+KG9uXtb91ANThgzMgOAb0WjiVmBvf48UszmSnX62dA@mail.gmail.com>
	<52CF2625.5030407@windriver.com> <52CF2ED0.8090605@linaro.org>
In-Reply-To: <52CF2ED0.8090605@linaro.org>
X-Enigmail-Version: 1.6
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 10 Jan 2014 01:14:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/09/2014 06:20 PM, Trevor Woerner wrote:
> On 01/09/14 17:43, Mark Hatle wrote:
>> On 1/9/14, 3:45 PM, Bruce Ashfield wrote:
>>> On Thu, Jan 9, 2014 at 1:45 PM, Trevor Woerner
>>> <trevor.woerner@linaro.org> wrote:
>>>> Hi everyone,
>>>>
>>>> At the last TSC meeting the topic of unmaintained layers came up. Here
>>>> is the sorted list of master layers from the layer index [1], would it
>>>> be possible for those in the know to indicate which layers are, or are
>>>> suspected of being, unmaintained?
>>>
>>> Wouldn't it be easier to do an initial sort based on commit activity
>>> ? Versus an
>>> opt-in query ?
>>
>> I agree..  see below for mine..
> 
> To be honest, I had asked people to indicate which layers they thought
> were *un*maintained (since I assumed that list would be small), but this
> way works too.
> 
> Interestingly enough, had I sorted the list on commit activity,
> according to http://git.yoctoproject.org/cgit/cgit.cgi/?s=idle
> meta-realtime hasn't been touched in 10 months which would make me
> suspect it was abandoned.

This approach is a good test of which layer maintainers are paying
attention to list traffic :)

Philip

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 

