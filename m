Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68009605F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 14:59:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8GExjbG005509
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Sep 2013 07:59:45 -0700 (PDT)
Received: from [128.224.146.246] (128.224.146.246) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 16 Sep 2013 07:59:44 -0700
Message-ID: <52371CDF.4020607@windriver.com>
Date: Mon, 16 Sep 2013 10:59:43 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: JC <jc@vtkloud.com>
References: <52339BE5.8000804@vtkloud.com>
In-Reply-To: <52339BE5.8000804@vtkloud.com>
X-Originating-IP: [128.224.146.246]
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: lib ao ?
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
X-List-Received-Date: Mon, 16 Sep 2013 14:59:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-09-13 07:12 PM, JC wrote:
> Hi,
>
> I cannot find a trace of libao. Is this present somewhere in some

It is:
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/libao/libao_0.8.8.bb

> openembedded-* repo I would have missed ? I could not find it in
> layers.openembedded.org

The UI for that site has changed, you have to set:
Branch: OE-Classic
to search meta-openembedded.

Painful, I know, but I assume there was confusion about what's in
oe-core and what's in OE-Classic.


// Randy
>
> Thanks for your help,
> Jay
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

