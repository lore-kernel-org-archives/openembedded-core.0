Return-Path: <prvs=043542d3a3=mike.looijmans@topicproducts.com>
Received: from mx42-out4.antispamcloud.com (mx42-out4.antispamcloud.com
	[138.201.61.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5236071AD1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 07:13:25 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx16.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1duBBz-0006dG-50; Tue, 19 Sep 2017 07:35:34 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 Sep 2017 07:35:23 +0200
To: Trevor Woerner <twoerner@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
	<a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
	<CAJTo0LaZo2Jhh7Jj=RAUzOzXq_FcXnobu-idL7RFnbq84iR_VA@mail.gmail.com>
	<CAJ86T=UqdDrT2ApxMiM=g__pTftCc5g0-gzs20vd-jV06+6x7w@mail.gmail.com>
	<CAJTo0LZrPSoVNAX6onFFsGgkD1LEm=2DLdBOecnhNEQBRDnS6A@mail.gmail.com>
	<CAJ86T=X5xAtSL4bK9tGLxrdxqtNh6ewG0n8rLfeiewL=cWA6xA@mail.gmail.com>
	<CAJTo0Lag_GCyfHCcEnNbfLOXSB+qyDhQHxUkdTF5RacgfxQEWg@mail.gmail.com>
	<CAJ86T=XFBTNtAg2_xPEFGTiH2Y_gZnRS_LZWkBWL2kPiUYARpA@mail.gmail.com>
	<CAJTo0LbOtfMY7mo5ASNZY0g3yd8+cwLEoWyMc4HifHH_nnyrjw@mail.gmail.com>
	<CAJ86T=XiebPX6z1zPReWd1cZ3U1Hz_rEZ6_8w=oLfZPFv1K5EQ@mail.gmail.com>
	<CAHUNapSrz4WHTPbcqq-9SeR_1TPvK2stK9S96jrt9HP1uXbaoQ@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <6885de7e-d486-97a0-6aae-44b21a933d16@topic.nl>
Date: Tue, 19 Sep 2017 07:35:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAHUNapSrz4WHTPbcqq-9SeR_1TPvK2stK9S96jrt9HP1uXbaoQ@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.09)
X-Recommended-Action: accept
X-Filter-ID: PqwsvolAWURa0gwxuN3S5YEa3T7JuZT23fGO2rGt3ZgWMD8gia7lRmdoHJ3n0cm6Vtfp9X1ZBchZ
	wvx8a7dTUQWF0kx98HH3GX+iQK7NiP6LBDMrD7q/cJogwbqzsuokIXMJ1U4MKKnQ5SAJ1V9dkP9x
	bu57BDazLmklZgT7xzZ5X3Fg4USa+LB4+iBBimKUdCmBhTVSnCOVQmQuBiTaTs7A5blfsacRtuL3
	ncWsS+s8CVsONrMJuGzuoGnKTKcygLJjfy2/hUPxxGqITycuLMdYaphGvYopQ24KJ9kgRDN3pbXn
	aMbbC1QSUBxihEsjBWOBqoptsYkcljagCMIDypReAQCFQo+KUtaSCrVTlxOfVsst/QEVbupaaYfx
	KYRJ8ar4sO9kYmr7/nmchPR9G2DCX9m2p4wUnZpURALMKaPBcC9OMLR/g2nFXNsLRUFi7RT86z7G
	T35rb3Tpbr1NcsCxQRoOZKcwDINXHduc8MTfLM7Ww0jFUCG51FTiiz6cR64dodD7udB+zcx8OjSt
	1b1YgBvhxKfoFZHs3o0j+S0jv2y8/jlUqm+TeNrMp4+EE+rDN/FnSl88wIa35p4FFV9l1/WyLBg0
	mKuTgAEprJGyxQgNyqqf/IN48z1lpo6ODRmiSLYXQoEVxAAhr5KC2/vg7iEFLP+SSY+Av5+AiC6H
	3owsO4DAdUlQv6V75QMSQrAqZTkENn3hzVQGtqpfy8or5rKA6eYGVgdFmQBLCGp8JmFmLZ6h3eau
	qEcwyeT0VZvJGSxm4bcH1lFUB/zPeGsnJ395jBJAgljEd2a/UHQV6Xe4bIYRHe1fiVaECIfGCs+d
	m3T5GTMS0IoMjuD73NkW0hXdwXAcFMPC3HLevdActK1VbuIevEZIZ0xtO4rEianNMhrFPd4d9v+R
	yYAcN0nX7KM/L6/1xy5PLYwxZPSrXMBzn0F1oDrD0qksn30/RzcBY99XeInJF1FLx+3hlevP/eyb
	7dZ1gnp8kuB8vMeopzLgn8wssArbkgpMfcNE8nTawQkj5C9a2CK2tkjhAg9PtOIqPA6w7IKmIzJA
	wKLvq+PGLkwUHCDwJGWSOuAi
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: profile: Get rid of "resize"
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
X-List-Received-Date: Tue, 19 Sep 2017 07:13:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 19-09-17 01:07, Trevor Woerner wrote:
> I use resize quasi-regularly. Ever end up in the situation where
> you've run vim and now the command-line has no idea how large the
> console is, so everything wraps or scrolls at the wrong times/places?
> resize fixes that:
>=20
> # . resize
>=20
> Please don't remove it.
>=20

We're not removing the "resize" command itself. It's about removing somethi=
ng=20
that started as a simple one-liner in /etc/profile to call "resize" (that d=
id=20
not fix the problem) and grew out to be a monster over time.


Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail




