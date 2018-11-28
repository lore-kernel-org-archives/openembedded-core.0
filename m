Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 475116C673
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 21:25:52 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 6A81D1C0036;
	Thu, 29 Nov 2018 10:25:53 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20181128045316.24102-1-douglas.royds@taitradio.com>
	<20181128045316.24102-6-douglas.royds@taitradio.com>
	<533e05c0d3614a888166cb7319b1b3d8@XBOX04.axis.com>
Message-ID: <09c52c30-b821-56e5-6db0-4a614f3f6b41@taitradio.com>
Date: Thu, 29 Nov 2018 10:25:53 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <533e05c0d3614a888166cb7319b1b3d8@XBOX04.axis.com>
Subject: Re: [PATCH 5/8] acl: Use install instead of cp
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
X-List-Received-Date: Wed, 28 Nov 2018 21:25:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

On 28/11/18 9:04 PM, Peter Kjellerstedt wrote:

>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of Douglas Royds
>> Sent: den 28 november 2018 05:53
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 5/8] acl: Use install instead of cp
>>
>> Also, hard-tabs begone
> Shell-code in OE-Core is expected to be indented using tabs, so don't
> do this. (For reference, OpenEmbedded uses four spaces to indent
> shell-code). Additionally, it makes it harder to see what you actually
> changed.


Fair point. I shouldn't have muddled the two together.



