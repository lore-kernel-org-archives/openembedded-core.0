Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id A457B734B8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 10:22:24 +0000 (UTC)
Received: (qmail 7627 invoked by uid 1003); 9 Oct 2015 10:22:24 -0000
Received: from unknown (HELO ?192.168.33.95?)
	(philip@opensdr.com@79.140.208.123)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	9 Oct 2015 10:22:24 -0000
To: Robert Yang <liezhi.yang@windriver.com>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAP71WjwYnv8WjH=s4gLVwwZV5KDdR=N5uxp9m46L_PesCBoZWA@mail.gmail.com>
	<56178EDE.5040508@windriver.com>
From: Philip Balister <philip@balister.org>
Message-ID: <5617955E.2090206@balister.org>
Date: Fri, 9 Oct 2015 11:22:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <56178EDE.5040508@windriver.com>
Subject: Re: Too late for mesa upgrade before jethro?
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
X-List-Received-Date: Fri, 09 Oct 2015 10:22:25 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 10/09/2015 10:54 AM, Robert Yang wrote:
> 
> On 10/09/2015 05:15 PM, Nicolas Dechesne wrote:
>> Hi,
>>
>> I am testing right now a patch to upgrade mesa from 10.6.3 to 10.6.9,
>> is it too
>> late for including it in jethro?
> 
> Generally speaking, yes, it is late, the feature cut off is
> is Sept. 28, 2015 noon GMT., here is the 1.9 Schedule:

But I think Nicolas is proposing this as a bug fix. If it doesn't go
into the release, I suspect he'll propose it for inclusion i the stable
branch soon after the release.

Philip

> 
> https://wiki.yoctoproject.org/wiki/Yocto_1.9_Schedule
> 
> // Robert
> 
>>
>> I should be able to send it on Monday.. If it's too late, i will
>> switch to mesa
>> 11 directly.
>>
>> Nico
>>
>>
>>

