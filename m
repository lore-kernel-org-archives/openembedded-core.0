Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8870B6CEEA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 13:55:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Dec 2013 05:51:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,811,1378882800"; d="scan'208";a="445308461"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.184])
	by orsmga002.jf.intel.com with ESMTP; 02 Dec 2013 05:55:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?S=E9bastien?= Mennetrier <s.mennetrier@innotis.org>
Date: Mon, 02 Dec 2013 13:55:27 +0000
Message-ID: <10916131.lVIbzf1xN1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1385990182-8215-1-git-send-email-s.mennetrier@innotis.org>
References: <1385990182-8215-1-git-send-email-s.mennetrier@innotis.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH] Add nginx http webserver
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
X-List-Received-Date: Mon, 02 Dec 2013 13:55:29 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi S=E9bastien,

On Monday 02 December 2013 14:16:22 S=E9bastien Mennetrier wrote:
> From: S=E9bastien <s.mennetrier@innotis.org>
>=20
> ---
>  meta-webserver/recipes-httpd/nginx/files/init      |  59 ++++++
>  .../nginx/files/nginx-cross_1.4.4.diff             | 212

Patches for meta-webserver (and all of the other layers in the meta-
openembedded repository) need to be sent to openembedded-
devel@lists.openembedded.org; could you please send it there?

Thanks,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

