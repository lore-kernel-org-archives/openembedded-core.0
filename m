Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1U8qQ8-0005yt-Hv
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 12:04:06 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1MAlm8Z023442
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Feb 2013 02:47:48 -0800 (PST)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Fri, 22 Feb 2013 02:47:47 -0800
Message-ID: <51274D32.4060703@windriver.com>
Date: Fri, 22 Feb 2013 18:49:22 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Martin Donnelly <martin.donnelly@ge.com>
References: <cover.1361265275.git.kai.kang@windriver.com>
	<97d24123c74069eea42442dca543d77c6fd6647a.1361265275.git.kai.kang@windriver.com>
	<51262CD4.7030303@ge.com>
In-Reply-To: <51262CD4.7030303@ge.com>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r1MAlm8Z023442
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] rpm: redirect output of post install script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Feb 2013 11:04:07 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2013=E5=B9=B402=E6=9C=8821=E6=97=A5 22:19, Martin Donnelly wrote:
> On 20/02/2013 06:16, Kang Kai wrote:
>> When distro feature "debug-tweak" enabled, redirect output of post
>> install script to log file which can be configured.
>
> Is the DISTRO_FEATURE not "debug-tweaks" here and not "debug-tweak"?

My mistake. It should be "debug-tweaks". Thanks.
I'll send new patches.

Regards,
Kai


>
> Martin
>



