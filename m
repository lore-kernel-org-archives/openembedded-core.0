Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qh7kq-0002et-F5
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 00:18:04 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Qh7h0-0000N5-Tn from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 15:14:06 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 13 Jul 2011 15:12:27 -0700
Received: from [172.30.80.17] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 13 Jul 2011 15:14:06 -0700
Message-ID: <4E1E18AA.2050808@mentor.com>
Date: Wed, 13 Jul 2011 15:14:02 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 13 Jul 2011 22:12:27.0499 (UTC)
	FILETIME=[F35ABBB0:01CC41A9]
Subject: siteinfo for recipes oe-core lacks?
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
X-List-Received-Date: Wed, 13 Jul 2011 22:18:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hey all,

Do we have an opinion on siteinfo for recipes that oe-core lacks?  I
have two easy examples:
- mono: neither meta-oe nor oe-core have a recipe, we have siteinfo
stuff specific to it.  Ignore it? drop it?  update it with what meta-oe has?
- postgresql: meta-oe has it, oe-core lacks it.  Keep in meta-oe only?

-- 
Tom Rini
Mentor Graphics Corporation


