Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QliLg-0005TD-Kt
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 16:11:04 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QliHc-00003T-V7 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 07:06:52 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 26 Jul 2011 07:04:09 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 26 Jul 2011 07:06:52 -0700
Message-ID: <4E2EC9F5.9000904@mentor.com>
Date: Tue, 26 Jul 2011 07:06:45 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1311656953-30417-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1311656953-30417-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 26 Jul 2011 14:04:09.0655 (UTC)
	FILETIME=[E3D94470:01CC4B9C]
Subject: Re: [PATCH] meta: Rename SITEINFO_ENDIANESS to	SITEINFO_ENDIANNESS
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
X-List-Received-Date: Tue, 26 Jul 2011 14:11:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/25/2011 10:09 PM, Khem Raj wrote:
> There is this discrepency in spelling. Lets fix it in
> core. There are lot of layers using SITEINFO_ENDIANNESS
> This was shielded since meta-oe had its own copy of
> siteinfo class. But that class has now been deleted in
> favor of oe-core
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Since this pops this off my list,

Acked-by: Tom Rini <tom_rini@mentor.com>

-- 
Tom Rini
Mentor Graphics Corporation


