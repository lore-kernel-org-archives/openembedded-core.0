Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 908B979978
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 03:02:06 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id C602B1C0010;
	Fri, 14 Sep 2018 15:02:06 +1200 (NZST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180912012707.30046-1-douglas.royds@taitradio.com>
	<20180912020259.13844.22579@do.openembedded.org>
	<6bf60656-78b8-7c83-4755-d0d6db9cb6b6@taitradio.com>
	<CAJTo0LaYWE56CxaakJ14gCEzVsJAszwUmP1WRnLMae8i5s-aTA@mail.gmail.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <8a88d875-7ac3-6fd4-0b8f-e111b75831d7@taitradio.com>
Date: Fri, 14 Sep 2018 15:02:06 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaYWE56CxaakJ14gCEzVsJAszwUmP1WRnLMae8i5s-aTA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFJlcHJvZHVjaWJsZTogRmluZCB0aGUgZ2l0IHJlcG8gaW4gV09SS0RJUi9naXQgb3IgUyBmaXJzdA==?=
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
X-List-Received-Date: Fri, 14 Sep 2018 03:02:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

On 14/09/18 04:11, Burton, Ross wrote:

> On 12 September 2018 at 03:15, Douglas Royds
> <douglas.royds@taitradio.com> wrote:
>> The patch series already was applied on top of b7f3f7ecfd.
> Fails for me too:
>
> Applying: Reproducible: Tidy class description
> Using index info to reconstruct a base tree...
> error: patch failed: meta/classes/reproducible_build.bbclass:1
> error: meta/classes/reproducible_build.bbclass: patch does not apply
> error: Did you hand edit your patch?
> It does not apply to blobs recorded in its index.


Lesson of the day: Don't use the -w (ignore whitespace) option to git 
format-patch


