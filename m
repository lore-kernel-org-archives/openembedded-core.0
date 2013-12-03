Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5CE576D8C4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 18:01:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB3I0rf5023687; Tue, 3 Dec 2013 18:00:53 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ydUb7r0W2-UF; Tue,  3 Dec 2013 18:00:53 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB3I0o03023684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 3 Dec 2013 18:00:52 GMT
Message-ID: <1386093645.4463.128.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Henning Heinold <heinold@inf.fu-berlin.de>
Date: Tue, 03 Dec 2013 18:00:45 +0000
In-Reply-To: <20131203173732.GD11291@mail.zedat.fu-berlin.de>
References: <20131203160858.GB11291@mail.zedat.fu-berlin.de>
	<529E0A3D.50809@balister.org>
	<20131203165509.GC11291@mail.zedat.fu-berlin.de>
	<CADkTA4MGqDjpeAHE4gVWVgSv51uauteHtUbcsErLCMOj3eBz2Q@mail.gmail.com>
	<20131203173732.GD11291@mail.zedat.fu-berlin.de>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Status for "Sponsored by" git tags
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
X-List-Received-Date: Tue, 03 Dec 2013 18:01:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-12-03 at 18:37 +0100, Henning Heinold wrote:
> On Tue, Dec 03, 2013 at 12:21:10PM -0500, Bruce Ashfield wrote:
> > On Tue, Dec 3, 2013 at 11:55 AM, Henning Heinold
> > Urk. Of the top of my head .. that just looks nasty. Signed-off-by:
> > already indicates
> > a company name, so going further than that is overkill IMHO.
> > 
> > Bruce
> 
> But what if it is contractor work, where the commiter has no company email.

Well, in the same way we acknowledge people who helped with a patch, you
can mention people/companies by name in commit messages and I can't see
an issue with that. I don't think it needs a specific tag form though.

Cheers,

Richard


