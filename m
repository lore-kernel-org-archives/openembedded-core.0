Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qb1Ir-0006Me-Up
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 04:11:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5R28GPH023714
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 26 Jun 2011 19:08:16 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sun, 26 Jun 2011 19:08:16 -0700
Message-ID: <4E07E63E.20702@windriver.com>
Date: Mon, 27 Jun 2011 10:09:02 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <4DF0A70C.7080501@windriver.com>
	<4DF0E4A8.1000608@windriver.com>	<4DFB26CE.7070807@windriver.com>
	<4DFB76E3.5090606@windriver.com> <4E0049AE.7050609@windriver.com>
In-Reply-To: <4E0049AE.7050609@windriver.com>
X-Originating-IP: [128.224.162.154]
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Question about apply eglibc configurability to create minimal image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Jun 2011 02:11:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mark,

Thanks for your great help.

I record the minimal eglibc configure options and the dependencies on 
them at

https://wiki.yoctoproject.org/wiki/Minimal_Image

People want make minimal image could follow the step and apply the 
patches in the page should get the same result with what I get.

I will try to put the patches on the maillist and then check what other 
people thinking.

Thanks and Regards,
Kai



