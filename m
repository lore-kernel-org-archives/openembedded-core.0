Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id AC3A6731C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 19:55:51 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id to18so851874igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 11:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=SuLzBM9vZm7UaLBhwkoxhYuxfbg2hRZnD2vJM/wCs/Y=;
	b=cqSV+W8r+P0O9yEVSCFjNGJhdm3kiDw2MpdSbMz+c2789sdGq9Pc0hYuo5MjxED07n
	0WxUI2f+NwlIfFw7M79MOqG1ugFi89JcMWwsdVuW6iKQu3G/2XBsVFjlWSpRcHlCPzuz
	xKRyqm/7lOGW9sTQH4gyccqoT8CjpCnsmNwYivYeATVtRKpKMHA8WdqG6lrk63uD46eh
	wzajC0ed7BtYq0mJoA419e2c1+MTLsGXTuOwLXBDPbybrlr1X7SXhn0BMvfSg6zGN9FV
	OwJVGxrnQwUh90e66YOBbRsz93VbIlLgIQ4s9MY6Wo8j3V7p9vXbCoQ12NTj14VnqNZX
	NmCA==
X-Received: by 10.50.66.236 with SMTP id i12mr204349igt.14.1451937352151;
	Mon, 04 Jan 2016 11:55:52 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	8sm15780005ioe.8.2016.01.04.11.55.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jan 2016 11:55:51 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1448720991-29707-1-git-send-email-twoerner@gmail.com>
	<5685A731.1070109@gmail.com>
	<CAJTo0LbzApjnimOTb1XiiJjt7UgOk5WGodf1ghDPK7tWR-KkfQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <568ACE43.9000009@gmail.com>
Date: Mon, 4 Jan 2016 14:55:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbzApjnimOTb1XiiJjt7UgOk5WGodf1ghDPK7tWR-KkfQ@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mkefidisk.sh: add boot log on console
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
X-List-Received-Date: Mon, 04 Jan 2016 19:55:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 01/04/16 11:20, Burton, Ross wrote:
>
> On 31 December 2015 at 22:07, Trevor Woerner <twoerner@gmail.com
> <mailto:twoerner@gmail.com>> wrote:
>
>     ping?
>
>
> Sorry, slipped through.  These are staged in ross/mut as of now.

Thanks Ross

