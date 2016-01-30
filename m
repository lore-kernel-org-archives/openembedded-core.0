Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E40B977176
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 01:15:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0U1FNlr015280
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Jan 2016 17:15:25 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 29 Jan 2016 17:15:23 -0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "liezhi.yang@windriver.com"
	<liezhi.yang@windriver.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
References: <cover.1454088695.git.hongxu.jia@windriver.com>
	<51387bed968918e5c45820eb32ee898485cc0544.1454088695.git.hongxu.jia@windriver.com>
	<a17cbe21ef44455c98414ba1a4f1ffdd@XBOX02.axis.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56AC0E9D.6050806@windriver.com>
Date: Sat, 30 Jan 2016 09:15:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <a17cbe21ef44455c98414ba1a4f1ffdd@XBOX02.axis.com>
Subject: Re: [PATCH 1/5] base/bbclass: use target path as compile dir in debugging info
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
X-List-Received-Date: Sat, 30 Jan 2016 01:16:02 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2016 01:48 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Hongxu Jia
>> Sent: den 29 januari 2016 18:36
>> To: openembedded-core@lists.openembedded.org;
>> liezhi.yang@windriver.com; raj.khem@gmail.com;
>> richard.purdie@linuxfoundation.org
>> Subject: [OE-core] [PATCH 1/5] base/bbclass: use target path as compile dir in debugging info
>                                   ^^^^^^^^^^^^
> Change the prefix to "bitbake.conf" to reflect that you now do the
> Change there...

Sorry for the typo

//Hongxu

>
> //Peter
>


