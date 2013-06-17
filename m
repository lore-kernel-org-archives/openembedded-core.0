Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 66D2060912
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 09:04:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5H94coa010395
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jun 2013 02:04:39 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 17 Jun 2013 02:04:38 -0700
Message-ID: <51BED10C.7050609@windriver.com>
Date: Mon, 17 Jun 2013 17:04:12 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <cover.1371392062.git.kai.kang@windriver.com>
	<30a61ca7883e5f9d8858c7b89884874e74a972c5.1371392062.git.kai.kang@windriver.com>
	<13f50fd5c00.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <13f50fd5c00.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] strace: update depends
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
X-List-Received-Date: Mon, 17 Jun 2013 09:04:41 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2013年06月17日 15:15, Bernhard Reutner-Fischer wrote:
> On 16 June 2013 16:16:25 Kai Kang <kai.kang@windriver.com> wrote:
>> Build strace with libaio and acl to support more features. Because no
>> native libaio package, just add dependencies for target.
>
> Do you mind updating to 4.8 while you touch it?
> Thanks,
>

OK, I'll check the new version of strace

>
> Sent with AquaMail for Android
> http://www.aqua-mail.com
>
>
>
>


-- 
Regards,
Neil | Kai Kang


