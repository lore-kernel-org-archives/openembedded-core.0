Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF09165D4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 09:25:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAA9PpUl026088
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Nov 2014 01:25:52 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 10 Nov 2014 01:25:50 -0800
Message-ID: <5460849B.9070403@windriver.com>
Date: Mon, 10 Nov 2014 17:25:47 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<CANyK_8eJXjkRzPNsEnvbj6ve=DQ-8YkXUnG9uTE5RqmG-GEF+Q@mail.gmail.com>
In-Reply-To: <CANyK_8eJXjkRzPNsEnvbj6ve=DQ-8YkXUnG9uTE5RqmG-GEF+Q@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/24] V2: Add machine qemuarm64
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
X-List-Received-Date: Mon, 10 Nov 2014 09:26:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年11月07日 19:01, Paul Barker wrote:
> On 7 November 2014 08:51, Kai Kang <kai.kang@windriver.com> wrote:
>>    gcc-4.9: redefine default library install directory
>>    Revert "gcc-4.9: redefine default library install directory"
> Can the original commit just be removed from the series rather than reverted?

We just want to keep the history how we get here. If nobody cares it, 
I'll remove them.

Thanks,
--Kai

>
> Thanks,
>


-- 
Regards,
Neil | Kai Kang


