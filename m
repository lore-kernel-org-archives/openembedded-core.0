Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1ShMoQ-00019z-KD
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:27:18 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 749A2D2380; Wed, 20 Jun 2012 17:16:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-144.dynamic.chello.pl
	[87.206.60.144])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 81363D232B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 17:16:07 +0200 (CEST)
Message-ID: <4FE1E933.70500@linaro.org>
Date: Wed, 20 Jun 2012 17:16:03 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120614 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FE1E603.4040408@linaro.org>
	<4FE1E8D7.2010407@communistcode.co.uk>
In-Reply-To: <4FE1E8D7.2010407@communistcode.co.uk>
Subject: Re: Apache recipe?
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
X-List-Received-Date: Wed, 20 Jun 2012 15:27:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 20.06.2012 17:14, Jack Mitchell pisze:
> On 20/06/12 16:02, Marcin Juszkiewicz wrote:
>> Does someone has recipe for Apache? I want to make LAMP image for our
>> tests and so far my choices are lighttpd or creation of new recipes for
>> Apache (based on 2.2.17 from OE classic).

> Last time I checked the PHP recipe needs a bit of love too, I've done a
> slightly updated customised build but it's a fantastic hackfest.
> 
> Any reason you specifically want Apache? I'm using Hiawatha webserver
> which is another lightweight alternative with PHP-cgi support as I
> wasn't too keen on lighttpd.
>
> I would be happy to provide the recipes if you wish you to use them.

I may end with lighttpd but would be great if you can share recipes.


