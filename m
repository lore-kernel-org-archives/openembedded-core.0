Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 7AAD66C5E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 20:23:08 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 55D121C0033;
	Fri, 23 Nov 2018 09:23:08 +1300 (NZDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181121223322.24819-1-douglas.royds@taitradio.com>
	<20181122003308.2329.32709@do>
	<a4eb28aa-e155-3d79-8045-0bba3214d5a9@taitradio.com>
	<CAJTo0LbxOJT6UZL-5ZokCeMMOn3e7MQ2ZLs7=iy=WJT7QZSaww@mail.gmail.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <99399e1e-1e53-dcfd-a6b5-eb9846050804@taitradio.com>
Date: Fri, 23 Nov 2018 09:23:08 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbxOJT6UZL-5ZokCeMMOn3e7MQ2ZLs7=iy=WJT7QZSaww@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGJvb3N0LWNvbnRleHQ6IFJlcHJvZHVjaWJpbGl0eTogU2V0IC5maWxlIHNlY3Rpb24gZm9yIGFsbCAqX2VsZl9nYXMuUyBmaWxlcyAocmV2Mik=?=
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
X-List-Received-Date: Thu, 22 Nov 2018 20:23:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

On 23/11/18 2:24 AM, Burton, Ross wrote:

> On Thu, 22 Nov 2018 at 00:38, Douglas Royds <douglas.royds@taitradio.com> wrote:
>> On 22/11/18 1:33 PM, Patchwork wrote:
>>
>>> ...
>>>
>>> * Issue             Upstream-Status is Submitted, but it is not mentioned where [test_upstream_status_presence_format]
>>>     Suggested fix    Include where reproducibility-add-file-directive-to-assembler.patch was submitted
>> Yes it is ...
>>
>>
>>>     Current          Upstream-Status: Submitted https://github.com/boostorg/context/issues/91
>>>     Standard format  Upstream-Status: Submitted [where]
> The [] is not syntactic markers but literal characters, i.e. it expects to see:
>
> Upstream-Status: Submitted [https://github.com/boostorg/context/issues/91]
>
> Yes, this test could be considered overly pedantic, but I'm also aware
> that raising and formalising this would be a bikeshed of epic
> proportions...
>
> Ross


Great, thanks, my mistake.


