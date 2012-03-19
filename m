Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1S9S6v-0006EU-Fi
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 03:14:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2J25K4T024791
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 Mar 2012 19:05:20 -0700 (PDT)
Received: from [128.224.162.241] (128.224.162.241) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sun, 18 Mar 2012 19:05:20 -0700
Message-ID: <4F669461.4020605@windriver.com>
Date: Mon, 19 Mar 2012 10:05:21 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331713107.git.kai.kang@windriver.com>
	<8e34c071af55fbd1bf52da1c78337ee9ea23e9e5.1331713107.git.kai.kang@windriver.com>
	<3AB6CE7F274E534CAFD089D127A8A1FC23AED058@SHSMSX102.ccr.corp.intel.com>
In-Reply-To: <3AB6CE7F274E534CAFD089D127A8A1FC23AED058@SHSMSX102.ccr.corp.intel.com>
X-Originating-IP: [128.224.162.241]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q2J25K4T024791
Cc: "Wold, Saul" <saul.wold@intel.com>, "Purdie,
	Richard" <richard.purdie@intel.com>
Subject: Re: [PATCH 5/8] alsa-utils: update to 1.0.25
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
X-List-Received-Date: Mon, 19 Mar 2012 02:14:13 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B403=E6=9C=8816=E6=97=A5 15:25, Wang, Shane wrote:
> Kang Kai wrote on 2012-03-14:
>
>> Update to version 1.0.25, and update patch
>> 0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch becaus=
e
>> rejected when apply it.
>>
>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>
> Kai, why did you drop the patch? You can port it to alsa-utils v1.0.25 =
code base, as I did.
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dshan=
e/m4upgrade&id=3D924cdfe1a0069ff53526afe67b11cbd9405472de

Hi Shane,

Yes, I just update the patch and don't drop it.
Maybe the comments is not clear, that I mean the patch is jejected by=20
bitbake when run do_patch.

Regards,
Kai


>
> --
> Shane
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



