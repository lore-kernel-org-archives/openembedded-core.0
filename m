Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T2ElC-000292-Jm
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 07:06:14 +0200
Received: by eekb57 with SMTP id b57so826287eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 21:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=y1UVv2oqiHwBaDnqA5bcCtUf8Zb4lm3z0/3Hujq/cZM=;
	b=FOrkYw/ue8qwkuZ399z4nA/pK2/q982Og/OTry8uv/6PO8aMR2FcpW+QgWQCT98XRS
	/qH1vTLP9fx4pAMCMxcje7EugbZO0Um3ibPZbyMUay3lnf+xpEzat+RRXtae3FesbBOm
	Lw5EEa6MROub4KifJhxlxapOAGYjTHY0gu91SuY54E2EwwJbMCi0WpkfbZs16F2JHRJY
	SvBwNAtA5HSfaJseSA72JMzuvpMA3JUayixz6lllpfPWKmO9prRJIb8LTQjGTQtgEn1U
	ly47vAX8x0PYpqtNdsP1SIHB/ffVtB+GEQIaIK06nEHXgdPw8suiGWCuuWiD2Srla/xv
	/clA==
Received: by 10.14.218.134 with SMTP id k6mr4759289eep.14.1345179256617; Thu,
	16 Aug 2012 21:54:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Thu, 16 Aug 2012 21:53:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Aug 2012 21:53:46 -0700
Message-ID: <CAMKF1soXfayHtE=L0hDKBJq9-D0M0uYvKibaJo-N0nzqjWmtfw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: contrib branches cleanup call
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
X-List-Received-Date: Fri, 17 Aug 2012 05:06:14 -0000
Content-Type: text/plain; charset=UTF-8

Hi All,

There are many branches in openembedded-core-contrib tree which have
been merged upstream. So please go through your list
and delete the one's which are already merged or otherwise not needed.

Thank you

-Khem


