Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49C136F5BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 03:03:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2S33mbb018759
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Mar 2014 20:03:48 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 27 Mar 2014 20:03:48 -0700
Message-ID: <5334E69A.90200@windriver.com>
Date: Fri, 28 Mar 2014 11:03:54 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1395825881.git.kai.kang@windriver.com>
	<CAP9ODKpRZXUxM=QGOBR4xmh=vBWBd6VOqYK0AZwvon_MG4pQGA@mail.gmail.com>
In-Reply-To: <CAP9ODKpRZXUxM=QGOBR4xmh=vBWBd6VOqYK0AZwvon_MG4pQGA@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Replace ocf-linux with cryptodev-linux
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
X-List-Received-Date: Fri, 28 Mar 2014 03:03:50 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年03月26日 22:42, Otavio Salvador wrote:
> Hello Kai,
>
> On Wed, Mar 26, 2014 at 7:15 AM, Kai Kang <kai.kang@windriver.com> wrote:
>> Replace ocf-linux with cryptodev-linux because linux-yocto use cryptodev-linux to implement /dev/crypto.
> Thanks for handling it; I was going to address same issue this week so
> we could have it upstreamed and drop the Freescale bbappends for it.
> This indeed makes my life easier :-) So thank you :-)
>

Hi Otavio,

It is my pleasure if it could help. :)

-- 
Regards,
Neil | Kai Kang


