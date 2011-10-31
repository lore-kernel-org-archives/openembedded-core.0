Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RKhV7-0007rA-Tn
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 03:21:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9V2FJZJ018598
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 30 Oct 2011 19:15:19 -0700 (PDT)
Received: from [128.224.162.225] (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sun, 30 Oct 2011 19:15:18 -0700
Message-ID: <4EAE04FF.1070207@windriver.com>
Date: Mon, 31 Oct 2011 10:16:31 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EAE0428.2020209@windriver.com>
In-Reply-To: <4EAE0428.2020209@windriver.com>
X-Originating-IP: [128.224.162.225]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p9V2FJZJ018598
Cc: Saul Wold <saul.wold@intel.com>
Subject: Re: What is the strategy to update eglibc?
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
X-List-Received-Date: Mon, 31 Oct 2011 02:21:26 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B410=E6=9C=8831=E6=97=A5 10:12, Kang Kai wrote:
> Hi Saul,
>
> I just want to update eglibc but eglibc is using its 2.14 branch and=20
> use svn commit revision "15225" as current version. Of course it is=20
> behind the latest svn revision, but I don't quit sure about which is=20
> the right revision to update eglibc.
Hi Saul,

And right now is 2 commits behind the latest revision, do it worth to=20
update right now?
Thanks!

>
> Could you give me some guide? Thank you!
>
> Regards,
> Kai
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



