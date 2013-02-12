Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U5MuO-00038r-7d
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 21:57:00 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id B38D2D22E8; Tue, 12 Feb 2013 21:40:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 1D103D22B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 21:40:26 +0100 (CET)
Message-ID: <511AA8B6.8040605@linaro.org>
Date: Tue, 12 Feb 2013 21:40:22 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <2760168.9kFd94gL1F@helios> <20130212191902.GD3300@jama>
	<26170862.UdgPXC9k0H@helios> <20130212195143.GE3300@jama>
In-Reply-To: <20130212195143.GE3300@jama>
Subject: Re: RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 20:57:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 12.02.2013 20:51, Martin Jansa pisze:

> xserver-common is similar to formfactor, a bit more flexible but a
> lot worse to maintain for new MACHINES

IIRC xserver-common allows to set all MACHINE related variables in
/etc/default/something file. I added that years ago when merged
xserver-common with xserver-kdrive-common with all OE/Poky patches etc.



