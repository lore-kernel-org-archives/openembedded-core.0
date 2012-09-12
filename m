Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Vladimir_Zapolskiy@mentor.com>) id 1TBlgp-0002Ko-QJ
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 14:05:08 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1TBlUf-0003hZ-8B from Vladimir_Zapolskiy@mentor.com ;
	Wed, 12 Sep 2012 04:52:33 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 12 Sep 2012 04:52:33 -0700
Received: from [172.30.4.60] (137.202.0.76) by SVR-IES-FEM-01.mgc.mentorg.com
	(137.202.0.104) with Microsoft SMTP Server (TLS) id 14.1.289.1;
	Wed, 12 Sep 2012 12:52:30 +0100
Message-ID: <50507778.3000208@mentor.com>
Date: Wed, 12 Sep 2012 14:52:24 +0300
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1347444916.2122.101.camel@ted>
In-Reply-To: <1347444916.2122.101.camel@ted>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 12 Sep 2012 11:52:33.0138 (UTC)
	FILETIME=[182CE520:01CD90DD]
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Feature Developement vs. Stablisation and Bug fixing
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
X-List-Received-Date: Wed, 12 Sep 2012 12:05:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

On 12.09.2012 13:15, Richard Purdie wrote:
> Hi,
>
> I know in the past this has taken some people by surprise. Both OE-Core
> and the Yocto Project are aiming at release points every six months,
> roughly October and April. In order to prepare for those there is a
> period of 6-8 weeks beforehand which is aimed at stabilisation and bug
> fixing.
>
> We are now entering that window where we need to heavily taper off new
> features and concentrate on the quality and stability of the release
> which is scheduled for mid October. I'm not saying no new feature
> patches will get taken but I will be asking questions like "why is this
> being worked on?" and "shouldn't this wait until after release?". I'd
> really like to see effort being focused on bugs now, not enhancements.
>
> I know there are a couple of things which have been worked on for a
> while and have been slightly delayed which I'd probably lean towards
> taking (some offline postinstall work spring to mind). I was asked
> whether I'd take a binutils update in a couple of weeks and the answer
> is no, I'd very likely not as we're at the point we need to lock in on
> the toolchain now (and major kernel version).
>
> Does anyone have any questions?
>

do you expect to have a filed bug in Yocto's bugzilla to attract attention
to a problem, or published patchset with problem description and a fix is
sufficient?

With best wishes,
Vladimir


