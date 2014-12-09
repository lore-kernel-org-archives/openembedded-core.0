Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A9E1165CAF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 01:53:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB91rfQq005225
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 8 Dec 2014 17:53:41 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 8 Dec 2014 17:53:40 -0800
Message-ID: <54865621.5000805@windriver.com>
Date: Tue, 9 Dec 2014 09:53:37 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<c11bc2b236f552a463398b4732c8b94e552faae7.1415350038.git.kai.kang@windriver.com>
	<CAJTo0LZ4VvpEE_xAMBzyox5bEnVBoquzDEAQr+Bek19uz-Tsrg@mail.gmail.com>
In-Reply-To: <CAJTo0LZ4VvpEE_xAMBzyox5bEnVBoquzDEAQr+Bek19uz-Tsrg@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/24] qemu: add single step support for aarch64
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
X-List-Received-Date: Tue, 09 Dec 2014 01:53:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年12月09日 04:53, Burton, Ross wrote:
> On 7 November 2014 at 08:51, Kai Kang <kai.kang@windriver.com> wrote:
>
>> Backport patches to enable signle-step support for aarch64.
>>
> As these are all related, can they be concatenated into a single patch?

OK if you think that is better. I'll update it.

--Kai


>
> Ross
>


-- 
Regards,
Neil | Kai Kang


