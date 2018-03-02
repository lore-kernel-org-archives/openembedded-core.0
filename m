Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1F45C789A8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 22:41:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w22MeM0U020720
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 2 Mar 2018 22:40:24 GMT
Message-ID: <1520030422.3436.26.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 02 Mar 2018 22:40:22 +0000
In-Reply-To: <20180302181449.GR2786@denix.org>
References: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
	<20180301140052.1388-14-alexander.kanavin@linux.intel.com>
	<CAJTo0LbB5ZAHTmcbv5Moof0kjYejw4XOskNawqH3sCopyxPSFg@mail.gmail.com>
	<20180302181449.GR2786@denix.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/15] expect: upgrade 5.45.3 -> 5.45.4
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
X-List-Received-Date: Fri, 02 Mar 2018 22:41:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-03-02 at 13:14 -0500, Denys Dmytriyenko wrote:
> FYI, sourceforge is currently experiencing issues (another DDoS
> attack?) and 
> instead of tarballs, serves HTML file with this text:
> 
> We're sorry -- the Sourceforge site is currently in Disaster Recovery
> mode, 
> and currently requires the use of javascript to function.  Please
> check back 
> later.

That explains some weird errors I saw on the new autobuilder setup but
hadn't debugged, thanks!

Cheers,

Richard

