Received: from bee.rz.hs-augsburg.de ([141.82.25.26])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.morscher@hs-augsburg.de>) id 1QyUSq-00005k-8d
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 21:59:16 +0200
Received: from [127.0.0.1] (ppp-188-174-68-143.dynamic.mnet-online.de
	[188.174.68.143]) (authenticated bits=0)
	by bee.RZ.HS-Augsburg.DE (8.14.3/8.14.3) with ESMTP id p7UJs6EU021217
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 21:54:07 +0200 (MEST)
Message-ID: <4E5D3FDC.6030901@hs-augsburg.de>
Date: Tue, 30 Aug 2011 21:54:04 +0200
From: Michael Morscher <michael.morscher@hs-augsburg.de>
Organization: HS Augsburg
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1314720867.5939.361.camel@rex>
In-Reply-To: <1314720867.5939.361.camel@rex>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.0
	(bee.RZ.HS-Augsburg.DE [141.82.16.16]);
	Tue, 30 Aug 2011 21:54:07 +0200 (MEST)
X-HSA-RZ-MailScanner-Information: Please contact the ISP for more information
X-HSA-RZ-MailScanner-ID: p7UJs6EU021217
X-HSA-RZ-MailScanner: Found to be clean
X-HSA-RZ-MailScanner-From: michael.morscher@hs-augsburg.de
X-HSA-RZ-MailScanner-Watermark: 1315338847.45744@cxpBz8TMy+WcadyMthaT3A
X-Spam-Status: No
Subject: Re: [PATCH] gtk-icon-cache: add hicolor-icon-theme to DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: michael.morscher@hs-augsburg.de,
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
X-List-Received-Date: Tue, 30 Aug 2011 19:59:16 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hey Richard,

Thanks for your answer. That patch hasn't fixed it for me, also the 
others don't... I checked your and Koens old conversations and tried all 
those patches, but no change :(
I have no idea why and some DEPEND and RDEPEND things didn't fix it as 
well. I'm not a pro at the moment.

I'm running the git master and copied those patches or manually edited 
the smaller things. I'm not sure but all other gnome/X (not gpe) things 
are broken due to that error.

MFG
Michael


