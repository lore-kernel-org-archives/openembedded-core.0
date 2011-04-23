Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mickey@vanille-media.de>) id 1QDaTz-0001Sz-PI
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 12:54:35 +0200
Received: from [192.168.2.2] (e180159149.adsl.alicedsl.de [85.180.159.149])
	by phalanx.drlauer-research.com (Postfix) with ESMTPSA id CDF80584019
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Apr 2011 13:09:10 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTinZAnhpu1fheLmp5HWT218ysN0=vg@mail.gmail.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
	<0daf49a24c9ff05b60377dad60234107009efbdb.1303453279.git.sgw@linux.intel.com>
	<BANLkTiksRbTcCmjcJDeiK=dzhY01N=O6CA@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE9451693F01@orsmsx504.amr.corp.intel.com>
	<BANLkTinZAnhpu1fheLmp5HWT218ysN0=vg@mail.gmail.com>
Organization: Vanille-Media
Date: Sat, 23 Apr 2011 12:44:51 +0200
Message-ID: <1303555491.2257.14.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 28/33] python-pycairo: fix installation path of __init__.py
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: mickey@vanille-media.de,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sat, 23 Apr 2011 10:54:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Feel free to get rid of the ml revision numbers, when you bump
any versions. The reason for that is historic and goes way back
to when I added Python to OpenZaurus, subsequently to OpenEmbedded,
and had to provide upgrade paths for precompiled feeds.

Nowadays the ml suffix has only sentimental value, so feel free
to kill it off where you see fit.

Cheers,

--
:M:

Dr. Michael Lauer
President, OpenEmbedded e.V.




